// Initial wiring: [0 2 3 1 4 5 6 7 8]
// Resulting wiring: [0 2 8 1 4 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[8], q[3];
cx q[8], q[3];
cx q[0], q[1];
cx q[5], q[6];
cx q[2], q[3];
