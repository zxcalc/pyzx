// Initial wiring: [7, 0, 8, 15, 5, 9, 1, 12, 13, 14, 3, 10, 2, 4, 6, 11]
// Resulting wiring: [7, 0, 8, 15, 5, 9, 1, 12, 13, 14, 3, 10, 2, 4, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[15], q[14];
cx q[9], q[10];
cx q[6], q[7];
