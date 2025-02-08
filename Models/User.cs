using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace user_management_system.Models
{
    public class User
    {
        public int Id { get; set; }

        public string BatchId { get; set; } = string.Empty;

        [Required]
        public string Fullname { get; set; } = string.Empty;
        public string Username { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;

        public string Position { get; set; } = string.Empty;

        public DateTime DateJoined { get; set; }

        public string Department { get; set; } = string.Empty;

        public string ReportingTo { get; set; } = string.Empty;

        public string AddedBy { get; set; } = string.Empty;

        [Column ("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public int NoOfTickets { get; set; }

        public string UserType { get; set; } = string.Empty;

        public string Access { get; set; } = string.Empty;
    }
}
