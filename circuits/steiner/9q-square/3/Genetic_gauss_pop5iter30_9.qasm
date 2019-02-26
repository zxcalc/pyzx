// Initial wiring: [0 4 1 3 2 6 5 7 8]
// Resulting wiring: [0 4 1 3 2 6 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[0];
cx q[1], q[2];
