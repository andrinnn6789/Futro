using Futro.Classes;

public class RegistrationStateService
{
    public Registration CurrentRegistration { get; set; }

    public void SetCurrentRegistration(Registration registration)
    {
        CurrentRegistration = registration;
    }
}