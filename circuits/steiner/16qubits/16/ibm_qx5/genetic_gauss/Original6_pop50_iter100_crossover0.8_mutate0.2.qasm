// Initial wiring: [7, 11, 4, 15, 6, 14, 13, 8, 5, 2, 1, 0, 9, 10, 3, 12]
// Resulting wiring: [7, 11, 4, 15, 6, 14, 13, 8, 5, 2, 1, 0, 9, 10, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[6], q[5];
cx q[12], q[7];
cx q[14], q[13];
cx q[15], q[7];
cx q[14], q[4];
cx q[10], q[11];
cx q[11], q[10];
cx q[6], q[9];
cx q[9], q[6];
cx q[1], q[4];
cx q[1], q[9];
cx q[1], q[8];
cx q[0], q[7];
