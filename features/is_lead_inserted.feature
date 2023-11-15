Feature:As a scheduler I want to check the Cancellation process for outside the auto refund period, 
        so that I can initiate the auto refund process within the website itself.
      
      Scenario: Should verify the cancellation process when the user id is empty
            Given Post the booking without user id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "User Id is required"
                  }
                  """
      Scenario: Should verify the cancellation process when the user id is invalid
            Given Post the booking with invalid user id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "Booking not available"
                  }
                  """
      Scenario: Should verify the cancellation process when the user id and Booking id were Mismatch
            Given Post the booking without Booking id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "Booking not available"
                  }
                  """
      Scenario: Should verify the cancellation process when the Transaction id is empty
            Given Post the booking without Transaction id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response":"Transaction Id is required"
                  }
                  """
      Scenario: Should verify the cancellation process when the Payment id is empty
            Given Post the booking without Payment id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "Payment Id is required"
                  }
                  """
      Scenario: Should verify the cancellation process when the CancellationInitiatedOn is empty 
            Given Post the booking without CancellationInitiatedOn
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Cancellation Initiated On is required"
            }
            """
      Scenario: Should verify the cancellation process when the Cancellation id is empty
            Given Post the booking without Cancellation id
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Cancellation Id is required"
            }
            """
      Scenario: Should verify the cancellation process when the ReasonForCancellation is empty 
            Given Post the booking without ReasonForCancellation
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Reason For Cancellation is required"
            }
            """



      Scenario: Should verify the cancellation process when the Refund Status is awaited with Refund details
            Given Post the booking to the Refund Status awaited  with Refund details
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "RefundDetails are available during Refund Awaited"
            }
            """
      Scenario: Should verify the cancellation process when the IsCancellation Completed is true and with the refund details
            Given Post the booking with IsCancellation Completed is true
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "IsCancellationCompleted should be false"
            }
            """

      Scenario: Should verify the cancellation process when the refund status available but refund issue date is invalid
            Given Post the booking with invalid refund date
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Refund Details not available"
            }
            """

      Scenario: Should verify the cancellation process when the refund status available but Refund _bank_ref_no invalid
            Given Post the booking with Refund _bank_ref_no invalid
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Refund Details not available"
            }
            """



      Scenario: Should verify the cancellation process when the refund status available but refund amount is invalid
            Given Post the booking with invalid refund amount
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Refund Details not available"
            }
            """

      Scenario: Should verify the cancellation process when the refund status available but order amount is invalid
            Given Post the booking with invalid order amount
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Refund Details not available"
            }
            """

      Scenario: Should verify the cancellation process when the offline booking is true
            Given Post the offline booking is true
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, This user Offline Booking "
            }
            """
      Scenario: Should verify the cancellation process after   Vehicle delivery
            Given Post the after Vehicle delivery
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, Vehicle Delivered details available for this user"
            }
            """
      Scenario: Should verify the cancellation process   after invoice
            Given Post the after invoice
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, Invoice details available for this user"
            }
            """
      Scenario: Should verify the cancellation process   after FullPayment
            Given Post the after FullPament
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, Fullpayment details available for this user"
            }
            """

      Scenario: Should verify the cancellation process when the duplicate booking
            Given Post when the duplicate booking
            When I receive a response
            Then I expect the response as
            """
            {
            "response":"Booking Already Cancelled"
            }
            """

#--------------------------------------------------------------------------------------------------------------------
#       Scenario:Should verify the Cancellation request with refund status as Awaited
#             Given Post the Cancellation request with refund status as Awaited 
#             When I receive a response
#             Then I expect the response as
#             """
#             {
#             "response": "RefundDetails are available during Refund Awaited"
#             } 
#             """
#       Scenario:Should verify the Cancellation request with refund status as Confirmed
#             Given Post the Cancellation request with refund status as Confirmed 
#             When I receive a response
#             Then I expect the response as
#             """
#             {
#             "status": "Success"
#             } 
#             """
#       Scenario:Should verify the Cancellation request with refund status as Declined
#             Given Post the Cancellation request with refund status as Declined
#             When I receive a response
#             Then I expect the response as
#             """
#             {
#             "status": "Success"
#             } 
#             """
#       Scenario:Should verify the Cancellation request with refund status as Failed
#             Given Post the Cancellation request with refund status as Failed 
#             When I receive a response
#             Then I expect the response as
#             """
#             {
#             "status": "Success"
#             } 
#             """
#--------------------------------------f&f--------------------------------------------------------------

#       Scenario:Should verify the Cancellation request without refund status and details in launchcity
#             Given Post the Cancellation request without refund status and details in launchcity
#             When I receive a response
#             Then I expect the response as
#             """
#             {
#             "status": "Success"
#             } 
#             """
#       Scenario:Should verify the Cancellation request without refund status and details in Prelaunchcity
#             Given Post the Cancellation request without refund status and details in Prelaunchcity 
#             When I receive a response
#             Then I expect the response as
#             """ 
#             {
#             "status": "Success"
#             } 
#             """
#       Scenario:Should verify the Cancellation request without refund status and details in ST-Prelaunchcity
#             Given Post the Cancellation request without refund status and details in ST-Prelaunchcity 
#             When I receive a response
#             Then I expect the response as
#             """
#             {
#             "status": "Success"
#             } 
#             """






