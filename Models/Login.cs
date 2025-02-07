using System.ComponentModel.DataAnnotations;

namespace user_management_system.Models
{
    public class Login 
    {
        public Login() { }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}