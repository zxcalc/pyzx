// Initial wiring: [15, 19, 17, 4, 5, 18, 9, 1, 6, 16, 11, 3, 0, 7, 12, 13, 2, 14, 8, 10]
// Resulting wiring: [15, 19, 17, 4, 5, 18, 9, 1, 6, 16, 11, 3, 0, 7, 12, 13, 2, 14, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[10], q[9];
cx q[12], q[7];
cx q[13], q[6];
cx q[14], q[5];
cx q[18], q[17];
cx q[18], q[11];
cx q[7], q[8];
