using Futro.Enums;

namespace Futro.Classes;

public class Participant
{
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public DateTime Birthdate { get; set; }
    public string Height { get; set; }
    public Gender Gender { get; set; }
    public ShirtSize TShirtSize { get; set; }
    public bool PlaysInClub { get; set; }
    public string Club { get; set; }
}