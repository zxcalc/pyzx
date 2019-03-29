// Initial wiring: [7, 2, 12, 11, 6, 19, 9, 5, 16, 3, 17, 13, 15, 18, 10, 0, 1, 4, 14, 8]
// Resulting wiring: [7, 2, 12, 11, 6, 19, 9, 5, 16, 3, 17, 13, 15, 18, 10, 0, 1, 4, 14, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[2];
cx q[18], q[12];
cx q[18], q[17];
cx q[12], q[7];
cx q[19], q[10];
cx q[9], q[11];
