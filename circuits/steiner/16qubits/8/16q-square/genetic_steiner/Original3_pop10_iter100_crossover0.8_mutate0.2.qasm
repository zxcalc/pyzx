// Initial wiring: [6, 9, 14, 7, 3, 5, 2, 1, 15, 11, 10, 4, 0, 13, 8, 12]
// Resulting wiring: [6, 9, 14, 7, 3, 5, 2, 1, 15, 11, 10, 4, 0, 13, 8, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[10], q[9];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[8];
cx q[11], q[12];
cx q[12], q[13];
cx q[4], q[11];
