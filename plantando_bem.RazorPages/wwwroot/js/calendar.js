document.addEventListener("DOMContentLoaded", function () {
    var currentDate = new Date();
    var currentMonth = currentDate.getMonth();
    var currentYear = currentDate.getFullYear();
    var prevMonthButton = document.getElementById("prev-month");
    var nextMonthButton = document.getElementById("next-month");
    var currentMonthLabel = document.getElementById("current-month");
    var calendarBody = document.getElementById("calendar-body");

    // Event listeners para os botões de navegação
    prevMonthButton.addEventListener("click", showPrevMonth);
    nextMonthButton.addEventListener("click", showNextMonth);

    // Exibir o calendário atual
    showCalendar(currentYear, currentMonth);

    function showCalendar(year, month) {
        calendarBody.innerHTML = "";
        currentMonthLabel.textContent = getMonthName(month) + " " + year;
        var firstDay = new Date(year, month, 1);
        var daysInMonth = new Date(year, month + 1, 0).getDate();

        for (var i = 0; i < firstDay.getDay(); i++) {
            var dayElement = document.createElement("div");
            dayElement.classList.add("day");
            calendarBody.appendChild(dayElement);
        }

        for (var day = 1; day <= daysInMonth; day++) {
            var dayElement = document.createElement("div");
            dayElement.classList.add("day");
            dayElement.textContent = day;
            dayElement.addEventListener("mouseover", function () {
                this.style.backgroundColor = "#808080";
            });
            dayElement.addEventListener("mouseout", function () {
                this.style.backgroundColor = "#f5f5f5";
            });
            calendarBody.appendChild(dayElement);
        }
    }

    function showPrevMonth() {
        currentMonth--;
        if (currentMonth < 0) {
            currentYear--;
            currentMonth = 11;
        }
        showCalendar(currentYear, currentMonth);
    }

    function showNextMonth() {
        currentMonth++;
        if (currentMonth > 11) {
            currentYear++;
            currentMonth = 0;
        }
        showCalendar(currentYear, currentMonth);
    }

    function getMonthName(month) {
        var monthNames = ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro",];
        return monthNames[month];
    }
});