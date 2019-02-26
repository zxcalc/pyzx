// Initial wiring: [0 1 2 3 5 4 6 7 8]
// Resulting wiring: [0 1 2 4 5 3 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[4], q[3];
cx q[1], q[0];
cx q[2], q[3];
