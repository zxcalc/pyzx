// Initial wiring: [6, 5, 8, 4, 13, 2, 1, 10, 11, 3, 7, 14, 9, 0, 12, 15]
// Resulting wiring: [6, 5, 8, 4, 13, 2, 1, 10, 11, 3, 7, 14, 9, 0, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[8], q[6];
cx q[9], q[5];
cx q[9], q[3];
cx q[11], q[3];
cx q[14], q[4];
cx q[12], q[5];
cx q[12], q[8];
cx q[10], q[15];
cx q[8], q[15];
cx q[6], q[11];
cx q[11], q[12];
cx q[2], q[13];
cx q[0], q[2];
cx q[2], q[15];
cx q[1], q[8];
