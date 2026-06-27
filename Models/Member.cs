namespace Library.Models
{
    public class Member : BaseEntity
    {

        public string FullName { get; set; } = string.Empty;
        public string NationalID  { get; set; } = string.Empty;

        public string Email { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;

        public string Phone { get; set; } = string.Empty;
    }
}
