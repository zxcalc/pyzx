// Initial wiring: [2, 1, 9, 6, 5, 14, 3, 0, 12, 11, 13, 10, 7, 8, 15, 4]
// Resulting wiring: [2, 1, 9, 6, 5, 14, 3, 0, 12, 11, 13, 10, 7, 8, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[12], q[11];
cx q[14], q[13];
cx q[6], q[7];
cx q[7], q[8];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
cx q[0], q[7];
