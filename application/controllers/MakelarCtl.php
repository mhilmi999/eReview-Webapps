<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MakelarCtl extends CI_Controller
{

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$data['username'] = $this->db->get_where('users', ['email' =>
		$this->session->userdata('email')])->row_array();
		echo 'Anda telah masuk sebagai Makelar' . $data['username'];
		echo '         ';
		echo anchor('AccountCtl/logout', 'logout');
		$this->load->view('makelar/BerandaMakelar');
	}
}
