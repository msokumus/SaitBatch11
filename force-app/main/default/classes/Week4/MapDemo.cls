public class MapDemo {
    public static string retrieveMounth(integer m) {
        string mounthName = '';
        Map<integer, string> mapMonth = new Map<integer, string>();
        mapMonth.put(1, 'Jan');
        mapMonth.put(2, 'Feb');
        mapMonth.put(3, 'Mar');
        mapMonth.put(4, 'Apr');

        mapMonth.put(5, 'May');
        mapMonth.put(6, 'Jun');
        mapMonth.put(7, 'Jul');
        mapMonth.put(8, 'Aug');

        mapMonth.put(9, 'Sep');
        mapMonth.put(10, 'Oct');
        mapMonth.put(11, 'Nov');
        mapMonth.put(12, 'Dec');
        
        Boolean keyVarsa = mapMonth.containsKey(m);
        if(keyVarsa){
        mounthName = mapMonth.get(m);
        } else {
        mounthName = 'Ay mevcut degil';
        }
        return mounthName;
    }
}
