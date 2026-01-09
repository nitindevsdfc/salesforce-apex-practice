public class contactTriggerHandler{

    public static void checkEmailBeforeInsert(List<Contact> contactList){

        for(contact con : contactList){
            if(con.Email == null){
                con.Email = 'nonemail@company.com';
            }
        }
    }
}