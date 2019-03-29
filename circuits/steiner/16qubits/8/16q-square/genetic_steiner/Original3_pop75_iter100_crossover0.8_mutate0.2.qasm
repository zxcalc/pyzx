// Initial wiring: [7, 10, 14, 1, 3, 4, 11, 9, 5, 2, 8, 0, 13, 6, 15, 12]
// Resulting wiring: [7, 10, 14, 1, 3, 4, 11, 9, 5, 2, 8, 0, 13, 6, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];
cx q[15], q[14];
cx q[10], q[11];
cx q[5], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[11], q[10];
cx q[4], q[5];
cx q[1], q[6];
cx q[6], q[9];
