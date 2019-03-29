// Initial wiring: [12, 4, 8, 5, 6, 9, 3, 15, 11, 13, 10, 7, 0, 14, 1, 2]
// Resulting wiring: [12, 4, 8, 5, 6, 9, 3, 15, 11, 13, 10, 7, 0, 14, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[1];
cx q[10], q[9];
cx q[14], q[15];
cx q[13], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[7], q[8];
cx q[6], q[7];
