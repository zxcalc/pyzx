// Initial wiring: [0, 15, 5, 13, 4, 9, 2, 12, 8, 10, 7, 1, 14, 11, 6, 3]
// Resulting wiring: [0, 15, 5, 13, 4, 9, 2, 12, 8, 10, 7, 1, 14, 11, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[13];
cx q[14], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[6], q[9];
