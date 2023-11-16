Feature:As a scheduler I want to verify the Cancellation process for users outside the auto-refund period.so that I can initiate the auto refund process directly within the website.
            
      Scenario: Should verify the cancellation process with empty user id
            Given Post the booking without a user id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "User Id is required"
                  }
                  """
      Scenario: Should verify the cancellation process with an invalid user id
            Given Post the booking with an invalid user id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "Booking not available"
                  }
                  """
      Scenario: Should verify the cancellation process when User id and Booking id mismatch
            Given Post the booking without a Booking id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "Booking not available"
                  }
                  """
      Scenario: Should verify the cancellation process when Transaction id is empty
            Given Post the booking without a Transaction id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response":"Transaction Id is required"
                  }
                  """
      Scenario: Should verify the cancellation process when Payment id is empty
            Given Post the booking without a Payment id
            When I receive a response
                  Then I expect the response as
                  """
                  {
                  "response": "Payment Id is required"
                  }
                  """
      Scenario: Should verify the cancellation process when CancellationInitiatedOn is empty
            Given Post the booking without CancellationInitiatedOn
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Cancellation Initiated On is required"
            }
            """
      Scenario: Should verify the cancellation process when Cancellation id is empty
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



      Scenario: Should verify the cancellation process when Refund Status is awaited with Refund details
            Given Post the booking to Refund Status as awaited with Refund details
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "RefundDetails are available during Refund Awaited"
            }
            """
      Scenario: Should verify the cancellation process when IsCancellation Completed is true with the refund details
            Given Post the booking with IsCancellation Completed as true
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "IsCancellationCompleted should be false"
            }
            """
      Scenario: Should verify the cancellation process when the RejectionReason is empty and RefundStatus as Confirmed
            Given Post the booking with RejectionReason and RefundStatus as Confirmed
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "RejectionReason should be null or empty"
            }
            """
      Scenario: Should verify the cancellation process when the RejectionReason is empty and RefundStatus as Failed
            Given Post the booking without RejectionReason and RefundStatus as Failed
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Missing mandatory paramteters in Refund details"
            }
            """
      Scenario: Should verify the cancellation process when the Refund_issue_date is empty and RefundStatus as Failed
            Given Post the booking without Refund_issue_date and RefundStatus as Failed
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Missing mandatory paramteters in Refund details"
            }
            """
      Scenario: Should verify the cancellation process when refund status as confirmed and Refund issue date is empty
            Given Post the booking with an invalid refund date
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Missing mandatory paramteters in Refund details"
            }
            """

      Scenario: Should verify the cancellation process when refund status as confirmed and Refund Bank Reference number is invalid
            Given Post the booking with an invalid Refund Bank Reference number
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Missing mandatory paramteters in Refund details"
            }
            """



      Scenario: Should verify the cancellation process when the refund status as confirmed and refund amount is invalid
            Given Post the booking with an invalid refund amount
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Missing mandatory paramteters in Refund details"
            }
            """

      Scenario: Should verify the cancellation process when refund status as confirmed and order amount is invalid
            Given Post the booking with an invalid order amount
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Missing mandatory paramteters in Refund details"
            }
            """

      Scenario: Should verify the cancellation process when offline booking is true
            Given Post the offline booking is true
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, This user Offline Booking "
            }
            """
      Scenario: Should verify the cancellation process after Vehicle delivery
            Given Post the booking after Vehicle delivery
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, Vehicle Delivered details available for this user"
            }
            """
      Scenario: Should verify the cancellation process after invoice
            Given Post the booking after invoice
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, Invoice details available for this user"
            }
            """
      Scenario: Should verify the cancellation process after Full Payment
            Given Post the booking after Full Payment
            When I receive a response
            Then I expect the response as
            """
            {
            "response": "Unable to cancel, Fullpayment details available for this user"
            }
            """

      Scenario: Should verify the cancellation process for duplicate booking
            Given Post the booking as duplicate
            When I receive a response
            Then I expect the response as
            """
            {
            "response":"Booking Already Cancelled"
            }
            """

#--------------------------------------------------------------------------------------------------------------------
      # Scenario:Should verify the Cancellation request with refund type as CCA and refund status as Awaited
      #       Given Post the Cancellation request with refund type as CCA and refund status as Awaited
      #       When I receive a response
      #       Then I expect the response as
      #       """
      #       {
      #       "status": "Success"
      #       }
      #       """
      # Scenario:Should verify the Cancellation request with refund type as CCA and refund status as Confirmed
      #       Given Post the Cancellation request with refund type as CCA and refund status as Confirmed
      #       When I receive a response
      #       Then I expect the response as
      #       """
      #       {
      #       "status": "Success"
      #       }
      #       """

      # Scenario:Should verify the Cancellation request with refund type as CCA and refund status as Failed
      #       Given Post the Cancellation request with refund type as CCA and refund status as Failed
      #       When I receive a response
      #       Then I expect the response as
      #       """
      #       {
      #       "status": "Success"
      #       }
      #       """


      # Scenario:Should verify the Cancellation request with refund type as F&F and refund status as awaited
      #       Given Post the Cancellation request with refund sttype as F&F and refund status as awaited
      #       When I receive a response
      #       Then I expect the response as
      #       """
      #       {
      #       "status": "Success"
      #       }
      #       """
      # Scenario:Should verify the Cancellation request with refund type as F&F and refund status as confirmed
      #       Given Post the Cancellation request with refund type as F&F and refund status as confirmed
      #       When I receive a response
      #       Then I expect the response as
      #       """
      #       {
      #       "status": "Success"
      #       }
      #       """
      # Scenario:Should verify the Cancellation request with refund type as F&F and refund status as failed
      #       Given Post the Cancellation request with refund type as F&F and refund status as failed
      #       When I receive a response
      #       Then I expect the response as
      #       """
      #       {
      #       "status": "Success"
      #       }
      #       """






