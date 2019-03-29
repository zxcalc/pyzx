// Initial wiring: [7, 10, 4, 9, 13, 1, 2, 0, 5, 6, 14, 12, 3, 8, 15, 11]
// Resulting wiring: [7, 10, 4, 9, 13, 1, 2, 0, 5, 6, 14, 12, 3, 8, 15, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[12], q[11];
cx q[11], q[10];
cx q[14], q[13];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[7];
cx q[0], q[1];
