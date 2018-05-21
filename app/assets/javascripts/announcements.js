// Announcement class
class Announcement {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attributes.content;
    this.created_at = moment(attributes.created_at).format('MM/DD/YY - h:mm A');
  }

  static renderAnnouncement(announcement) {
    return Announcement.announcementTemplate(announcement)
  }
}

function announcementsSetUp() {
  bindAnnouncementClickHandlers();

  Announcement.announcementDiv = $(".announcement-div");
  Announcement.announcementSource = $("#announcement-template").html();
  Announcement.announcementTemplate = Handlebars.compile(Announcement.announcementSource);
}

function bindAnnouncementClickHandlers() {

  $("#announcement-next-link").on("click", function(e) {
    e.preventDefault();


    $.ajax({
        method: "GET",
        url: "/announcements/1" ,
        dataType: "json"
    })
    .done(printAnnouncement)
    .error(function() {console.log("Something went wrong")});
  });
}

function printAnnouncement(json) {
  let announcement = Announcement.renderAnnouncement(json);
  Announcement.announcementDiv.empty();

  Announcement.announcementDiv.append(announcement);
}
