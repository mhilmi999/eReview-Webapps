<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AccountCtl extends CI_Controller {

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

	public function __construct()
	{
		parent::__construct();
		$this->load->model(array('Account'));
		$this->load->helper('form');
		$this->load->library('form_validation');
		$this->load->library('session');
	}

	public function index()
	{
		$this->load->view('welcome_message');
	}

	public function login($pesan='')
	{
		$this->load->view('login',array('msg' => $pesan));
	}

	public function createAccount($pesan='')
	{
		$this->load->view('create_Account',array('msg' => $pesan));
	}
	
	public function createingAccount(){
		
		$this->form_validation->set_rules(
			'nama','Nama',
			'trim|min_length[2]|max_length[250]|xss_clean');
		$this->form_validation->set_rules(
			'username','Username',
			'trim|min_length[2]|max_length[128]|xss_clean');
		$this->form_validation->set_rules(
			'email','Email',
			'trim|min_length[2]|max_length[256]|xss_clean');
		$this->form_validation->set_rules(
			'password','Password',
			'trim|min_length[2]|max_length[128]|xss_clean');
		
		$res = $this->form_validation->run();
		if ($res == FALSE) {
			$msg = validation_errors();
			$this->load->view('createAccount', array('msg' => $msg));
			return FALSE;
		}

		$id_user = $this->Account->insertNewUser();
		redirect('AccountCtl/login);
	}
	public function checkingLogin(){

		$this->form_validation->set_rules(
			'username',
			'Username',
			'trim|min_length[2]|max_length[128]|xss_clean');
			
		$this->form_validation->set_rules(
			'password',
			'Password',
			'trim|min_length[2]|max_length[128]|xss_clean');
		
		$res = $this->form_validation->run();
		if ($res == FALSE) {
			$msg = validation_errors();
			$this->load->view('login', array('msg' => $msg));
			return FALSE;
		}

		$id_user = $this->Account->getIdUser();
		$username = $this->input->post('username');
		//$id_grup = $this->Account->getPeranUser();
		

		if ($id_user == -1) {
			$this->load->view('login', array('msg' => 'Username/Password Invalid'));
		} 
		else {
			$peran = $this->Account->getPeranUser($id_user);
			$data_session = array(
				'nama' => $username

			);
			$this->session->set_userdata($data_session);
			
			if ($peran == '0') {
				// MATI
				//redirect('EditorCtl/index/'. $id_user);
				redirect('EditorCtl/index');
			} elseif ($peran == '1') {
				// Bundir
				//redirect('ReviewerCtl/index/'. $id_user);
				redirect('ReviewerCtl/index');
			} else {
				// Gantung Diri
				//redirect('MakelarCtl/index/'. $id_user);
				redirect('MakelarCtl/index');
			}
			
		}		
	}
	
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('AccountCtl/login');
	}
}
