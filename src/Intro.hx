package;
using Markdown;
class Intro{
    static inline var nanjizalBeach = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Nanjizal_cove_from_Carn_Boel_August_2008.jpg/320px-Nanjizal_cove_from_Carn_Boel_August_2008.jpg";
    static inline var photographer = "https://commons.wikimedia.org/wiki/User:JimChampion!";
    static inline var cc = "https://creativecommons.org/licenses/by/3.0/";
    static inline var linkGuardian = "http://www.theguardian.com/travel/2011/jul/15/secert-beaches-south-west-nanjizal";
    static inline var content: String = '# Nanjizal <sub><sub>A secret beach at the end of the land.<sub><sub>
![]($nanjizalBeach)

[<sub><sup>photo<sub><sup>]($nanjizalBeach)
<sub><sup> by [jimChampion]($photographer) is licensed under [cc by 3.0]($cc), more about Nanjizal beach on the guardian [website]($linkGuardian).

###This domain is just my place on the net to experiment and create, and not specifically related to this beach.';
    public static inline function markdown(): String {
        return content.markdownToHtml();
    }
}
