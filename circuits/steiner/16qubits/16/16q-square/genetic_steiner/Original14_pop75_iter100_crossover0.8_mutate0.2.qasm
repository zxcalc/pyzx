// Initial wiring: [7, 10, 0, 8, 14, 13, 15, 12, 11, 1, 5, 2, 3, 4, 6, 9]
// Resulting wiring: [7, 10, 0, 8, 14, 13, 15, 12, 11, 1, 5, 2, 3, 4, 6, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[4];
cx q[14], q[15];
cx q[10], q[11];
cx q[11], q[12];
cx q[8], q[9];
cx q[5], q[6];
cx q[1], q[6];
cx q[1], q[2];
