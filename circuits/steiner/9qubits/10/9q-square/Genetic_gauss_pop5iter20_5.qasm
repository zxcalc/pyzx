// Initial wiring: [7 1 2 3 5 0 6 4 8]
// Resulting wiring: [7 0 2 8 5 1 6 4 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[1];
cx q[1], q[2];
cx q[7], q[8];
cx q[1], q[4];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[7], q[4];
cx q[2], q[3];
cx q[4], q[3];
