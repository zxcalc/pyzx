// Initial wiring: [14, 6, 13, 3, 10, 9, 11, 7, 8, 4, 2, 15, 5, 12, 1, 0]
// Resulting wiring: [14, 6, 13, 3, 10, 9, 11, 7, 8, 4, 2, 15, 5, 12, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[13], q[12];
cx q[12], q[13];
cx q[13], q[14];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[12];
