using Futro.Enums;

namespace Futro.Classes;

public class Representative
{
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string PhoneNumber { get; set; }
    public Gender Gender { get; set; }
    public Address Address { get; set; }
    public string Camp { get; set; }
    public IEnumerable<string> Profession { get; set; }
}