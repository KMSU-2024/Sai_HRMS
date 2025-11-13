report 33065490 "Room Wise Deatails Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './RoomWiseDetailsDataPreview.rdl';

    dataset
    {
        dataitem("Room Wise Details";"Room Wise Details")
        {
            column(Entry_No_;"Entry No.")
            {
            }
            column(Room_No_;"Room No.")
            {
            }
            column(Floor_No_;"Floor No.")
            {
            }
            column(TRADE_DEPT;"TRADE/DEPT")
            {
            }
            column(Area_of_flooring;"Area of flooring")
            {
            }
            column(Type_of_flooring;"Type of flooring")
            {
            }
            column(Area_of_Short_wall;"Area of Short wall")
            {
            }
            column(Area_of_Long_wall;"Area of Long wall")
            {
            }
            column(Area_of_Ceiling;"Area of Ceiling")
            {
            }
            column(Type_of_ceiling;"Type of ceiling")
            {
            }
            column(No_of_Window;"No of Window")
            {
            }
            column(Type_of_Window;"Type of Window")
            {
            }
            column(No_of_Doors;"No of Doors")
            {
            }
            column(Type_of_door;"Type of door")
            {
            }
            column(No_of_officer_cabinet;"No of officer cabinet")
            {
            }
            column(No_of_Chair;"No of Chair")
            {
            }
            column(Type_of_Chair;"Type of Chair")
            {
            }
            column(No_of_Table;"No of Table")
            {
            }
            column(Type_of_Table;"Type of Table")
            {
            }
            column(No_of_Desk;"No of Desk")
            {
            }
            column(Type_of_Desk;"Type of Desk")
            {
            }
            column(AC;AC)
            {
            }
            column(No_of_Fan_Ceiling_;"No of Fan(Ceiling)")
            {
            }
            column(Type_of_Ceiling_Fan_;"Type of Ceiling(Fan)")
            {
            }
            column(No_of_Fan_Wall_;"No of Fan(Wall)")
            {
            }
            column(No_of_Ceiling_Light;"No of Ceiling Light")
            {
            }
            column(No_of_CCTV;"No of CCTV")
            {
            }
            column(No_of_Desktop;"No of Desktop")
            {
            }
            column(No_of_Printer;"No of Printer")
            {
            }
        // trigger OnAfterGetRecord()var myInt: Integer;
        // begin
        //     Clear(FileUploadStatus);
        //     if "Hostel Building"."Uploaded FileName" <> '' then FileUploadStatus:='Available'
        //     else
        //         FileUploadStatus:='Not Available';
        // end;
        }
    }
// requestpage
// {
//     AboutTitle = 'Teaching tip title';
//     AboutText = 'Teaching tip content';
//     layout
//     {
//         area(Content)
//         {
//             group(GroupName)
//             {
//                 field(Name; SourceExpression)
//                 {
//                 }
//             }
//         }
// }
}
