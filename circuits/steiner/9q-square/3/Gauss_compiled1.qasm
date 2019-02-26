// Initial wiring: [0 4 2 8 7 5 6 1 3]
// Resulting wiring: [0 4 1 8 7 5 6 2 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[4], q[3];
cx q[3], q[2];
