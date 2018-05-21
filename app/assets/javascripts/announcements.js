// Announcement class
class Announcement {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attributes.content;
    this.created_at = moment(attributes.created_at).format('MMM DD, YYYY - h:mm A');
  }

  // prototype method to format the announcement, returns
  // a string of HTML
  formatAnnouncement() {
    let formattedAnnouncement = `<div id="announcement" data-id=${this.id}>`;
    formattedAnnouncement += '<p style="color: red;">' + this.content + "<p>"
    formattedAnnouncement += "<i>Posted @ " + this.created_at + "<i>";
    formattedAnnouncement += "</div>";

    return formattedAnnouncement;
  }
}

// Set up to load the first announcement on page load
// Called from base.js on document.ready
function announcementsSetUp() {
  loadFirstAnnouncement();
  bindAnnouncementClickHandlers();

  Announcement.announcementDiv = $(".announcement-content-div");
}

// Set up a handler for the click event on the
// "Next Announcement" link
function bindAnnouncementClickHandlers() {
  $("#announcement-next-link").on("click", function(e) {
    e.preventDefault();

    let announcement_id = $("#announcement").data("id")

    $.ajax({
        method: "GET",
        url: `announcements/${announcement_id}/next` ,
        dataType: "json"
    })
    .done(function (json) {
      let announcement = createAnnouncement(json)
      printAnnouncement(announcement);
    })
    .error(function() {console.log("Something went wrong in binding click handlers.")});
  });
}

// GETs all of the announcements from the backend and
// prints the first one to the page
function loadFirstAnnouncement() {
  $.ajax({
      method: "GET",
      url: "/announcements",
      dataType: "json"
  })
  .done(function(json) {
    let firstAnnouncement = createAnnouncement(json[0]) // json is an Array of announcements
    printAnnouncement(firstAnnouncement);
  })
  .error(function() {console.log("Something went wrong in getting the first announcement.")});
}

// Create a new Announcement Object from a hash of announcement
// attributes returned from the backend
function createAnnouncement(attributes) {
  return new Announcement(attributes);
}

// Inject the new announcement into the DOM
function printAnnouncement(announcement) {
  Announcement.announcementDiv.empty();
  Announcement.announcementDiv.append(announcement.formatAnnouncement());
}
