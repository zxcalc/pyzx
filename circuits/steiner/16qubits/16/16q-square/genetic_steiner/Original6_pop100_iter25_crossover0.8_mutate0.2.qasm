// Initial wiring: [14, 11, 5, 10, 3, 6, 2, 13, 15, 7, 8, 9, 12, 4, 0, 1]
// Resulting wiring: [14, 11, 5, 10, 3, 6, 2, 13, 15, 7, 8, 9, 12, 4, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[6];
cx q[7], q[0];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[15];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[7];
cx q[4], q[5];
cx q[2], q[5];
cx q[1], q[2];
cx q[1], q[6];
cx q[2], q[5];
