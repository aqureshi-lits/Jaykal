pageextension 80060 "LIT EmployeeList" extends "Employee List"
{
    layout
    {

        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = all;
                Caption = 'Zkteco Emp.Id';

            }
        }

        addafter(Comment)

        {

            field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
            {

                ApplicationArea = All;

            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }


        }

        addafter(Control1)
        {
            field("Passport Expiry Date"; Rec."Passport Expiry Date")
            {
                ApplicationArea = all;
            }

            field("Visa Expiry Date"; Rec."Visa Expiry Date")
            {
                ApplicationArea = all;
            }

            field("Labour Expiry Date"; Rec."Labour Expiry Date")
            {
                ApplicationArea = all;
            }
        }


        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Absence Registration")
        {
            // action("Print Pay Slip")
            // {
            //     ApplicationArea = all;
            //     Caption = 'Print Pay Slip';
            //     Visible = false;
            //     Enabled = false;
            //     Ellipsis = true;
            //     Image = Payment;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;

            //     trigger OnAction()
            //     var
            //         EmpRec: Record 5200;
            //     begin
            //         EmpRec.RESET;
            //         EmpRec.SETRANGE("No.", Rec."No.");
            //         REPORT.RUNMODAL(80038, TRUE, FALSE, EmpRec);
            //     end;
            // }
        }
    }

}