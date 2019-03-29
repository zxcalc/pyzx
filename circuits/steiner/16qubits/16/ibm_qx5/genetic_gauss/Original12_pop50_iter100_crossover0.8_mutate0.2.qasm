// Initial wiring: [10, 6, 11, 5, 1, 15, 9, 13, 12, 0, 8, 7, 3, 2, 4, 14]
// Resulting wiring: [10, 6, 11, 5, 1, 15, 9, 13, 12, 0, 8, 7, 3, 2, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[0];
cx q[7], q[6];
cx q[10], q[2];
cx q[9], q[4];
cx q[12], q[2];
cx q[14], q[3];
cx q[15], q[8];
cx q[12], q[15];
cx q[12], q[13];
cx q[6], q[8];
cx q[6], q[12];
cx q[2], q[11];
cx q[2], q[7];
cx q[5], q[6];
