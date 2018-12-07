package Factory;


public class EmplFactory {
    public enum enEmployee {
        PRESIDENT,
        MANAGER,
        DESIGNER
    }

    public static Employee makeEmpl(enEmployee employee) {
        switch (employee) {
            case PRESIDENT:
                return new President();
            case MANAGER:
                return new Manager();
            case DESIGNER:
                return new Designer();
            default:
                return null;
        }
    }

    public static void main(String[] args) {
        Employee employee = EmplFactory.makeEmpl(enEmployee.MANAGER);
        employee.doWork();
    }
}
