// Announcement class
class Announcement {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attributes.content;
    this.created_at = moment(attributes.created_at).format('MM/DD/YY - h:mm A');
  }

  // static renderAnnouncement(announcement) {
  //   return Announcement.announcementTemplate(announcement)
  // }

  formatAnnouncement() {
    let formattedAnnouncement = `<div id="announcement" data-id=${this.id}>`;
    formattedAnnouncement += this.content + " - created @ " + this.created_at;
    formattedAnnouncement += "</div>";

    return formattedAnnouncement;
  }
}

function announcementsSetUp() {
  loadFirstAnnouncement();
  bindAnnouncementClickHandlers();

  Announcement.announcementDiv = $(".announcement-content-div");
  //
  // Announcement.announcementSource = $("#announcement-template").html();
  // Announcement.announcementTemplate = Handlebars.compile(Announcement.announcementSource);
}

function loadFirstAnnouncement() {
  $.ajax({
      method: "GET",
      url: "/announcements",
      dataType: "json"
  })
  .done(getFirstAnnouncement)
  .error(function() {console.log("Something went wrong in getting the first announcement.")});
}

function getFirstAnnouncement(json) {
  let firstAnnouncement = createAnnouncement(json[0]);
  printAnnouncement(firstAnnouncement);
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
  //let announcement = Announcement.renderAnnouncement(json);'
  debugger;
  Announcement.announcementDiv.empty();
  Announcement.announcementDiv.append(announcement.formatAnnouncement());
}
