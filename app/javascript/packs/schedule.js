// External Libraries
import Swal from 'sweetalert2';
import moment from 'moment';

// Alert Code
const emptySlots = document.querySelectorAll('.empty-slot');

function createTimeObject(timeString) {
  timeString = timeString.substr(0,2) + ":" + timeString.substr(2);
  return moment(timeString, 'hh:mm');
}

function calculateHoursMinutesFree(start_time, end_time) {
  const duration = moment.duration(end_time.diff(start_time));
  return [parseInt(duration.asHours()), parseInt(duration.asMinutes())%60];
}

function createStringHours(hours) {
  switch (hours) {
    case 0:
      return "";
    case 1:
      return "1 hr";
    default:
      return hours + " hrs";
  }
}

function createStringMinutes(andWord, minutes) {
  switch (minutes) {
    case 0:
      return "";
    case 1:
      return ` ${andWord} 1 min`;
    default:
      return " " + andWord + " " + minutes + " mins";
  }
}

function createStringTimeAvailable(hours, minutes) {
  let andWord = (hours > 0 && minutes > 0) ? "and" : "";
  return `${createStringHours(hours)} ${createStringMinutes(andWord, minutes)}`;
}

function displayFreeTime(e) {
  const technicianName = e.target.dataset.name;
  const start = createTimeObject(e.target.dataset.start);
  const end = createTimeObject(e.target.dataset.end);
  const [hours, minutes] = calculateHoursMinutesFree(start, end);
  const stringTimeAvailable = createStringTimeAvailable(hours, minutes);

  Swal.fire(`${stringTimeAvailable} available\r\n${moment(start).format("h:mma")} - ${moment(end).format("h:mma")}\r\n${technicianName}
    `);
}

// Event Listeners
emptySlots.forEach((empty_slot) => {
  empty_slot.addEventListener('click', displayFreeTime);
});
