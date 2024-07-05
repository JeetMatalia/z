import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> MailFeedback(String name, String mobile, String email, String review) async {
  final service_id = 'service_tk10w6q'; // Update with your actual service ID
  final template_id = 'template_dn2ss3j'; // Update with your actual template ID
  final user_id = 'Vwm4w1xae9iVIQ8FV'; // Update with your actual user ID
  var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  try {
    var response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': service_id,
          'template_id': template_id,
          'user_id': user_id,
          'template_params': {
            'name': name,
            'mobile': mobile,
            'email': email,
            'review': review,
          }
        })
    );

    print('[FEEDBACK RESPONSE] ${response.body}');
  } catch (error) {
    print('[FEEDBACK RESPONSE ERROR] $error');
  }
}
