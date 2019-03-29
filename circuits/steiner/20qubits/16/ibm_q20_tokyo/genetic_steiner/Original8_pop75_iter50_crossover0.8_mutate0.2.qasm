// Initial wiring: [7, 0, 11, 12, 14, 18, 15, 9, 19, 4, 8, 13, 10, 6, 16, 17, 1, 3, 2, 5]
// Resulting wiring: [7, 0, 11, 12, 14, 18, 15, 9, 19, 4, 8, 13, 10, 6, 16, 17, 1, 3, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[6];
cx q[7], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[7];
cx q[15], q[14];
cx q[18], q[17];
cx q[16], q[17];
cx q[13], q[16];
cx q[13], q[14];
cx q[9], q[11];
cx q[6], q[12];
cx q[12], q[18];
cx q[0], q[9];
