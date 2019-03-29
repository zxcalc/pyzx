// Initial wiring: [10, 9, 15, 6, 5, 7, 3, 0, 8, 4, 2, 11, 1, 13, 14, 12]
// Resulting wiring: [10, 9, 15, 6, 5, 7, 3, 0, 8, 4, 2, 11, 1, 13, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[9], q[6];
cx q[9], q[8];
cx q[6], q[5];
cx q[12], q[11];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[14];
cx q[10], q[11];
cx q[6], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[3], q[4];
cx q[2], q[5];
cx q[1], q[6];
cx q[6], q[9];
cx q[1], q[2];
