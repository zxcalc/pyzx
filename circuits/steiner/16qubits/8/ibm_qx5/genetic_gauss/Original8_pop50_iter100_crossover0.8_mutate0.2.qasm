// Initial wiring: [2, 13, 4, 14, 0, 12, 8, 15, 5, 6, 10, 3, 9, 7, 11, 1]
// Resulting wiring: [2, 13, 4, 14, 0, 12, 8, 15, 5, 6, 10, 3, 9, 7, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[1];
cx q[10], q[9];
cx q[11], q[6];
cx q[13], q[7];
cx q[15], q[13];
cx q[13], q[5];
cx q[9], q[11];
cx q[0], q[9];
