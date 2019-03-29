// Initial wiring: [7, 14, 6, 15, 12, 5, 2, 11, 10, 8, 1, 9, 13, 0, 4, 3]
// Resulting wiring: [7, 14, 6, 15, 12, 5, 2, 11, 10, 8, 1, 9, 13, 0, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[6];
cx q[14], q[13];
cx q[13], q[12];
cx q[15], q[14];
