using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace user_management_system.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public enum Role
        {
            Admin,
            User
        }

        [Column ("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}
