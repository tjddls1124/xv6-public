	.text

/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */
	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */
	pushal
	
	//save esp to current thread
	movl current_thread, %eax 
	movl %esp, (%eax)

	//current_thread->sp = next_thread->sp
	movl next_thread, %ebx
	movl %ebx, current_thread
	
//	movl $0, next_thread 
//restore next thread, Do Not have to do this?


	//To run current_thread
	movl current_thread, %eax
	movl (%eax), %esp
		

	
	/*   In this situation, current_thread == next_thread 
	   what makes this run possible? eax? */

	
	popal
	ret				/* pop return address from stack */
