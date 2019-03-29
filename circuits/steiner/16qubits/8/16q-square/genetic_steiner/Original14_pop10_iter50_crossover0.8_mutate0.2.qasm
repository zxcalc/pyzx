// Initial wiring: [12, 8, 3, 14, 13, 15, 6, 9, 4, 7, 0, 1, 5, 2, 11, 10]
// Resulting wiring: [12, 8, 3, 14, 13, 15, 6, 9, 4, 7, 0, 1, 5, 2, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[1], q[0];
cx q[15], q[14];
cx q[14], q[15];
cx q[13], q[14];
cx q[14], q[15];
cx q[15], q[14];
cx q[9], q[14];
cx q[14], q[15];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[9];
