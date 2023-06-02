// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Newtonsoft.Json;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Models.Localidades;
using plantando_bem.RazorPages.Areas.Identity.Data;
using Microsoft.EntityFrameworkCore;

namespace plantando_bem.RazorPages.Areas.Identity.Pages.Account
{
    public class RegisterModel : PageModel
    {
        private readonly IdentityDataContext _context;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<RegisterModel> _logger;
        private readonly IEmailSender _emailSender;
        public RegisterModel(
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            SignInManager<IdentityUser> signInManager,
            ILogger<RegisterModel> logger,
            IEmailSender emailSender,
            IdentityDataContext context)
        {
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            _context = context;
        }

        [BindProperty]
        public InputModel Input { get; set; }
        [BindProperty]
        public UserModel Usuario { get; set; } = new();
        [BindProperty]
        public List<EstadoModel> Estados { get; set; } = new();
        public CidadeModel Cidade { get; set; }
        public EstadoModel Estado { get; set; }
        [BindProperty]
        public int IdEstado { get; set; }
        [BindProperty]
        public int IdCidade { get; set; }
        public string ReturnUrl { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public IList<AuthenticationScheme> ExternalLogins { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public class InputModel
        {
            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            [Display(Name = "Password")]
            public string Password { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [DataType(DataType.Password)]
            [Display(Name = "Confirm password")]
            [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
            public string ConfirmPassword { get; set; }
        }


        public async Task<IActionResult> OnGetAsync(string returnUrl = null)
        {
             
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
            using (var httpCliente = new HttpClient())
            {
                string url = $"https://servicodados.ibge.gov.br/api/v1/localidades/estados";
                var response = await httpCliente.GetAsync(url);
                
                var content = await response.Content.ReadAsStringAsync();
                Estados = JsonConvert.DeserializeObject<List<EstadoModel>>(content)!.ToList();
                Estados = Estados.OrderBy(e => e.Nome).ToList();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            returnUrl ??= Url.Content("~/");
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
            if (ModelState.IsValid)
            {
                using (var httpCliente = new HttpClient())
                {
                    string url = $"https://servicodados.ibge.gov.br/api/v1/localidades/estados/{IdEstado}";
                    var response = await httpCliente.GetAsync(url);
                    
                    var content = await response.Content.ReadAsStringAsync();
                    Estado = JsonConvert.DeserializeObject<EstadoModel>(content)!;
                }

                var existRegiao = _context.Regiao.FirstOrDefaultAsync(k => k.Id == Estado.Regiao.Id).Result;

                if(existRegiao == null) {
                    await _context.AddAsync(Estado.Regiao);
                } else {
                    _context.Entry(existRegiao).State = EntityState.Detached;
                }

                var existEstado = _context.Estado.FirstOrDefaultAsync(k => k.Id == Estado.Id).Result;

                if(existEstado == null) {
                    Estado.IdRegiao = Estado.Regiao.Id;
                    Estado.Regiao = null;
                    await _context.AddAsync(Estado);
                } else {
                    _context.Entry(existEstado).State = EntityState.Detached;
                }
                
                using (var httpCliente = new HttpClient())
                {
                    string url = $"https://servicodados.ibge.gov.br/api/v1/localidades/municipios/{IdCidade}";
                    var response = await httpCliente.GetAsync(url);
                    
                    var content = await response.Content.ReadAsStringAsync();
                    Cidade = JsonConvert.DeserializeObject<CidadeModel>(content)!;
                }

                var existUF = _context.UF.FirstOrDefaultAsync(k => k.Id == Cidade.Microrregiao.Mesorregiao.UF.Id).Result;
                
                if(existUF == null) {
                    Cidade.Microrregiao.Mesorregiao.UF.IdRegiao = Cidade.Microrregiao.Mesorregiao.UF.Regiao.Id;
                    Cidade.Microrregiao.Mesorregiao.UF.Regiao = null;
                    await _context.AddAsync(Cidade.Microrregiao.Mesorregiao.UF);
                } else {
                    _context.Entry(existUF).State = EntityState.Detached;
                }

                var existMesso = _context.Mesorregiao.FirstOrDefaultAsync(k => k.Id == Cidade.Microrregiao.Mesorregiao.Id).Result;
                
                if(existMesso == null) {
                    Cidade.Microrregiao.Mesorregiao.IdUF = Cidade.Microrregiao.Mesorregiao.UF.Id;
                    Cidade.Microrregiao.Mesorregiao.UF = null;
                    await _context.AddAsync(Cidade.Microrregiao.Mesorregiao);
                } else {
                    _context.Entry(existMesso).State = EntityState.Detached;
                }

                var existMicro = _context.Microrregiao.FirstOrDefaultAsync(k => k.Id == Cidade.Microrregiao.Id).Result;
                
                if(existMicro == null) {
                    Cidade.Microrregiao.IdMessorregiao = Cidade.Microrregiao.Mesorregiao.Id;
                    Cidade.Microrregiao.Mesorregiao = null;
                    await _context.AddAsync(Cidade.Microrregiao);
                } else {
                    _context.Entry(existMicro).State = EntityState.Detached;
                }

                var existRegInt = _context.RegiaoIntermediaria.FirstOrDefaultAsync(k => k.Id == Cidade.RegiaoImediata.RegiaoIntermediaria.Id).Result;
                
                if(existRegInt == null) {
                    Cidade.RegiaoImediata.RegiaoIntermediaria.IdUF = Cidade.RegiaoImediata.RegiaoIntermediaria.UF.Id;
                    Cidade.RegiaoImediata.RegiaoIntermediaria.UF = null;

                    await _context.AddAsync(Cidade.RegiaoImediata.RegiaoIntermediaria);
                } else {
                    _context.Entry(existRegInt).State = EntityState.Detached;
                }

                var existRegIme = _context.RegiaoImediata.FirstOrDefaultAsync(k => k.Id == Cidade.RegiaoImediata.Id).Result;
                
                if(existRegIme == null) {
                    Cidade.RegiaoImediata.IdRegiaoInt = Cidade.RegiaoImediata.RegiaoIntermediaria.Id;
                    Cidade.RegiaoImediata.RegiaoIntermediaria = null;

                    await _context.AddAsync(Cidade.RegiaoImediata);
                } else {
                    _context.Entry(existRegIme).State = EntityState.Detached;
                }

                var existCidade = _context.Cidade.FirstOrDefaultAsync(k => k.Id == Cidade.Id).Result;
                
                if(existCidade == null) {
                    Cidade.IdRegiaoImediata = Cidade.RegiaoImediata.Id;
                    Cidade.RegiaoImediata = null;
                    Cidade.IdMicrorregiao = Cidade.Microrregiao.Id;
                    Cidade.Microrregiao = null;

                    await _context.AddAsync(Cidade);
                } else {
                    _context.Entry(existCidade).State = EntityState.Detached;
                }

                try {
                    Usuario.IdCidade = Cidade.Id;
                    Usuario.IdEstado = Estado.Id;

                    await _context.AddAsync(Usuario);
                    await _context.SaveChangesAsync();
                } catch(DbUpdateException exp) {
                    return Page();
                }

                var user = CreateUser();

                await _userStore.SetUserNameAsync(user, Input.Email, CancellationToken.None);
                await _emailStore.SetEmailAsync(user, Input.Email, CancellationToken.None);
                var result = await _userManager.CreateAsync(user, Input.Password);

                if (result.Succeeded)
                {
                    _logger.LogInformation("User created a new account with password.");

                    var userId = await _userManager.GetUserIdAsync(user);
                    var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    var callbackUrl = Url.Page(
                        "/Account/ConfirmEmail",
                        pageHandler: null,
                        values: new { area = "Identity", userId = userId, code = code, returnUrl = returnUrl },
                        protocol: Request.Scheme);

                    await _emailSender.SendEmailAsync(Input.Email, "Confirm your email",
                        $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.");

                    if (_userManager.Options.SignIn.RequireConfirmedAccount)
                    {
                        return RedirectToPage("RegisterConfirmation", new { email = Input.Email, returnUrl = returnUrl });
                    }
                    else
                    {
                        await _signInManager.SignInAsync(user, isPersistent: false);
                        return LocalRedirect(returnUrl);
                    }
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            // If we got this far, something failed, redisplay form
            return Page();
        }

        private IdentityUser CreateUser()
        {
            try
            {
                return Activator.CreateInstance<IdentityUser>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(IdentityUser)}'. " +
                    $"Ensure that '{nameof(IdentityUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }

        private IUserEmailStore<IdentityUser> GetEmailStore()
        {
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<IdentityUser>)_userStore;
        }
    }
}
