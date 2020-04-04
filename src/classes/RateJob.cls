/**
 * Created by alxan on 03.04.2020.
 */

global class RateJob implements Schedulable {
    global void execute(SchedulableContext ctx) {
        NBRBService service = new NBRBService();
        service.getRateByCodeAndDate();
    }
}