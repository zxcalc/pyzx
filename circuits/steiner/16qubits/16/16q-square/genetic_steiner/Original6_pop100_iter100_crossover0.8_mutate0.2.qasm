// Initial wiring: [15, 14, 5, 4, 6, 11, 13, 7, 8, 2, 3, 0, 1, 10, 12, 9]
// Resulting wiring: [15, 14, 5, 4, 6, 11, 13, 7, 8, 2, 3, 0, 1, 10, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[1];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[12], q[11];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[9];
cx q[15], q[8];
cx q[11], q[12];
cx q[10], q[13];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[6];
cx q[0], q[7];
cx q[7], q[8];
