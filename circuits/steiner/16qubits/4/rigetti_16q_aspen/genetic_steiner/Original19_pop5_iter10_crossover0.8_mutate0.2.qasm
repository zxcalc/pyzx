// Initial wiring: [11, 7, 12, 8, 10, 9, 1, 0, 15, 6, 5, 3, 2, 13, 4, 14]
// Resulting wiring: [11, 7, 12, 8, 10, 9, 1, 0, 15, 6, 5, 3, 2, 13, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[12], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[14], q[13];
cx q[15], q[14];
cx q[8], q[15];
cx q[15], q[14];
cx q[14], q[15];
cx q[0], q[15];
