// Announcement class
class Announcement {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attributes.content;
    this.created_at = moment(attributes.created_at).format('MMM DD, YYYY - h:mm A');
  }

  formatAnnouncement() {
    let formattedAnnouncement = `<div id="announcement" data-id=${this.id}>`;
    formattedAnnouncement += '<p style="color: red;">' + this.content + "<p>"
    formattedAnnouncement += "<i>Posted @ " + this.created_at + "<i>";
    formattedAnnouncement += "</div>";

    return formattedAnnouncement;
  }
}

function announcementsSetUp() {
  loadFirstAnnouncement();
  bindAnnouncementClickHandlers();

  Announcement.announcementDiv = $(".announcement-content-div");
}

function loadFirstAnnouncement() {
  $.ajax({
      method: "GET",
      url: "/announcements",
      dataType: "json"
  })
  .done(function(json) {
    let firstAnnouncement = createAnnouncement(json[0])
    printAnnouncement(firstAnnouncement);
  })
  .error(function() {console.log("Something went wrong in getting the first announcement.")});
}

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

function createAnnouncement(attributes) {
  return new Announcement(attributes);
}

function printAnnouncement(announcement) {
  Announcement.announcementDiv.empty();
  Announcement.announcementDiv.append(announcement.formatAnnouncement());
}
